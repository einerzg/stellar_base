defmodule StellarBase.XDR.TrustLineEntryTest do
  use ExUnit.Case

  import StellarBase.Test.Utils, only: [create_account_id: 1]

  alias StellarBase.XDR.{
    TrustLineEntry,
    AssetType,
    AlphaNum4,
    AssetCode4,
    Ext,
    UInt32,
    Int64,
    TrustLineAsset
  }

  describe "TrustLineEntry" do
    setup do
      account_id = create_account_id("GCNY5OXYSY4FKHOPT2SPOQZAOEIGXB5LBYW3HVU3OWSTQITS65M5RCNY")

      issuer = create_account_id("GBZNLMUQMIN3VGUJISKZU7GNY3O3XLMYEHJCKCSMDHKLGSMKALRXOEZD")

      asset_type = AssetType.new(:ASSET_TYPE_CREDIT_ALPHANUM4)

      asset =
        "BTCN"
        |> AssetCode4.new()
        |> AlphaNum4.new(issuer)
        |> TrustLineAsset.new(asset_type)

      balance = Int64.new(5_000_000)

      limit = Int64.new(6_000_000)

      flags = UInt32.new(1)

      ext = Ext.new()

      %{
        account_id: account_id,
        asset: asset,
        balance: balance,
        limit: limit,
        flags: flags,
        ext: ext,
        trust_line_entry: TrustLineEntry.new(account_id, asset, balance, limit, flags, ext),
        binary:
          <<0, 0, 0, 0, 155, 142, 186, 248, 150, 56, 85, 29, 207, 158, 164, 247, 67, 32, 113, 16,
            107, 135, 171, 14, 45, 179, 214, 155, 117, 165, 56, 34, 114, 247, 89, 216, 0, 0, 0, 1,
            66, 84, 67, 78, 0, 0, 0, 0, 114, 213, 178, 144, 98, 27, 186, 154, 137, 68, 149, 154,
            124, 205, 198, 221, 187, 173, 152, 33, 210, 37, 10, 76, 25, 212, 179, 73, 138, 2, 227,
            119, 0, 0, 0, 0, 0, 76, 75, 64, 0, 0, 0, 0, 0, 91, 141, 128, 0, 0, 0, 1, 0, 0, 0, 0>>
      }
    end

    test "new/1", %{
      account_id: account_id,
      asset: asset,
      balance: balance,
      limit: limit,
      flags: flags,
      ext: ext
    } do
      %TrustLineEntry{
        account_id: ^account_id,
        asset: ^asset,
        balance: ^balance,
        limit: ^limit,
        flags: ^flags,
        ext: ^ext
      } = TrustLineEntry.new(account_id, asset, balance, limit, flags, ext)
    end

    test "encode_xdr/1", %{trust_line_entry: trust_line_entry, binary: binary} do
      {:ok, ^binary} = TrustLineEntry.encode_xdr(trust_line_entry)
    end

    test "encode_xdr!/1", %{trust_line_entry: trust_line_entry, binary: binary} do
      ^binary = TrustLineEntry.encode_xdr!(trust_line_entry)
    end

    test "decode_xdr/2", %{trust_line_entry: trust_line_entry, binary: binary} do
      {:ok, {^trust_line_entry, ""}} = TrustLineEntry.decode_xdr(binary)
    end

    test "decode_xdr/2 with an invalid binary" do
      {:error, :not_binary} = TrustLineEntry.decode_xdr(123)
    end

    test "decode_xdr!/2", %{trust_line_entry: trust_line_entry, binary: binary} do
      {^trust_line_entry, ^binary} = TrustLineEntry.decode_xdr!(binary <> binary)
    end
  end
end
