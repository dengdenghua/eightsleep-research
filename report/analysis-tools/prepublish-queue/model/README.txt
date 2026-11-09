Frank 发布前队列模型（合成验证，不是实机仿真）

入口与复跑
  python3 run_cases.py
仅使用Python标准库。只在本目录写RESULTS和traces，不访问网络、不加载账号、
不执行固件或NATS。fixture正文为不透明合成字节，不是传感记录或已验证CBOR。

源码分工
  model.py / Ring：N槽、N-1条可用、缓存索引刷新、拷贝入队、成功后释放/推进读指针。
  model.py / RawCaller：入口限定为正文已生成且分配无异常；只模拟enqueue正常bool
    返回后对应的失败日志、临时副本释放、logger序号推进与ready清零。
  model.py / Worker：在维护gate允许进入相关分支的前提下，模拟3个JS队列扫描、
    core优先、API失败保留头/清连接，以及成功后pop/轮转。连接结果由fixture注入。
  model.py / PublishObservation：API返回、是否额外观察ACK、远端可能已接受的情景
    标签互相独立。非0返回不能说明服务端一定没收到；0返回也不伪造ACK观测。
  run_cases.py：10个有限场景；另用collections.deque独立比较1024组动作轨迹、
    共8192步，检查满拒新、FIFO、索引回绕与空队列。冻结每场景事件快照，避免
    后续恢复场景污染早先“持续失败”记录。

代码依据
  FUN_0019a970 构造：raw/log/第三JS环槽数17/1025/33，可用16/1024/32条。
  FUN_001f49b0 入队：满时return0发生在subject/body复制前；成功最后推进write。
  FUN_001e9390 raw调用点：mask1走raw.log队列；其他已路由raw类型共享raw队列。
  FUN_001afe00 worker：成功释放并pop，失败保留；JS成功才推进轮转cursor。
具体来源文件及SHA-256在RESULTS.json的source_manifest；每个轨迹事件列source_claims。

边界
16条是消息容量，不是16个样本、固定字节数或固定时间。多种raw消息可共享它。
失败后从未推进的cursor重新扫描；此前为空的更靠前队列若新到消息，可以先处理。
队首阻塞场景限定失败队列始终是本轮第一个非空候选，不能写成worker绝对锁死。
core优先用有限已在队列中的fixture，不建模core生产或实际到达率。
worker运行标志清零的分支返回但不遍历释放队列；这不等于完整stop/destructor。
已开始的发布调用可能先完成；模型步骤为原子动作，不模拟停止与调用并发。
分配异常、内存可见性、维护gate调度、NATS内部ACK/去重、物理持久化和云端均不在范围。
logger序号不是uploader chunk/batch序号，也不能单凭实际跳号断定本环形队列丢弃。

产物
RESULTS.json：场景结论、状态、来源SHA、明确限制。
RESULTS_ZH.txt：中文简述。
traces/<case>.jsonl：按步骤事件。
traces/<case>-records.json：按合成record_id汇总从caller、ring到publish返回的轨迹。
轨迹没有“真实服务端已接收/重复落库”字段，因为本轮没有这样的观测材料。
