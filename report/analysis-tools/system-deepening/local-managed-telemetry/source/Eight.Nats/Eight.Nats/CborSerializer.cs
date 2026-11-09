using PeterO.Cbor;

namespace Eight.Nats;

public static class CborSerializer
{
	private static readonly CBORTypeMapper TypeMapper = new CBORTypeMapper();

	public static byte[] Serialize<T>(T data)
	{
		return ProcessCborObject(CBORObject.FromObject(data, TypeMapper)).EncodeToBytes();
	}

	private static CBORObject ProcessCborObject(CBORObject obj)
	{
		if (obj.Type == CBORType.Map)
		{
			CBORObject cBORObject = CBORObject.NewMap();
			{
				foreach (CBORObject key2 in obj.Keys)
				{
					CBORObject cBORObject2 = obj[key2];
					if (!cBORObject2.IsNull)
					{
						CBORObject valueOb = ProcessCborObject(cBORObject2);
						if (key2.Type == CBORType.TextString)
						{
							string key = ToCamelCase(key2.AsString());
							cBORObject.Add(key, valueOb);
						}
						else
						{
							cBORObject.Add(key2, valueOb);
						}
					}
				}
				return cBORObject;
			}
		}
		if (obj.Type == CBORType.Array)
		{
			CBORObject cBORObject3 = CBORObject.NewArray();
			for (int i = 0; i < obj.Count; i++)
			{
				CBORObject obj2 = obj[i];
				cBORObject3.Add(ProcessCborObject(obj2));
			}
			return cBORObject3;
		}
		return obj;
	}

	private static string ToCamelCase(string name)
	{
		if (!string.IsNullOrEmpty(name) && !char.IsLower(name[0]))
		{
			return char.ToLowerInvariant(name[0]) + name.Substring(1, name.Length - 1);
		}
		return name;
	}
}
