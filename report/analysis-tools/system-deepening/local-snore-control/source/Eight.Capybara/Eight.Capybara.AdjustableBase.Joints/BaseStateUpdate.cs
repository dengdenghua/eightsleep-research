using Eight.Accessory.BedFrame;
using NodaTime;

namespace Eight.Capybara.AdjustableBase.Joints;

public record BaseStateUpdate(FrameState FrameState, SystemFlags SystemFlags, Instant TimeStamp);
