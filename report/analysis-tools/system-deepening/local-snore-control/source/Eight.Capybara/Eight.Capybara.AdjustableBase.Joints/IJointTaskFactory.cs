namespace Eight.Capybara.AdjustableBase.Joints;

public interface IJointTaskFactory
{
	JointTask PauseJointTask();

	JointTask MoveJointTask(IJointBaseAdapter jointBaseAdapter, MoveRequest request);

	JointTask StopJointTask(IJointBaseAdapter jointBaseAdapter);

	JointTask SnoreMitigationTask(IJointBaseAdapter jointBaseAdapter, SnoreMitigationRequest request);
}
