namespace Eight.Firmness.Models.Telemetry;

public record SolenoidTemp(int BagId, double InflateTempC, double DeflateTempC)
{
	public override string ToString()
	{
		return $"Bag{BagId}: in={InflateTempC:F1}°C out={DeflateTempC:F1}°C";
	}
}
