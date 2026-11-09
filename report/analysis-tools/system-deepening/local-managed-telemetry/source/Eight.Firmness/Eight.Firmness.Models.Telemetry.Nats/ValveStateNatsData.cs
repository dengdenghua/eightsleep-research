namespace Eight.Firmness.Models.Telemetry.Nats;

public record ValveStateNatsData(uint InflateState, uint InflateDutyPercent, uint DeflateState, uint DeflateDutyPercent, bool InflateChanged, bool DeflateChanged);
