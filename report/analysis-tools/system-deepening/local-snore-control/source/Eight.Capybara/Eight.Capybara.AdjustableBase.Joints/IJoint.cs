namespace Eight.Capybara.AdjustableBase.Joints;

public interface IJoint
{
	JointPosition CurrentPosition { get; }

	void MakeRequest(Request request);
}
