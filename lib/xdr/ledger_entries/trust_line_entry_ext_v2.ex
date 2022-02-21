defmodule StellarBase.XDR.TrustLineEntryExtV2 do
  @moduledoc """
  Representation of Stellar `TrustLineEntryExtV2` type.
  """
  alias StellarBase.XDR.{Int32, Ext}

  @behaviour XDR.Declaration

  @struct_spec XDR.Struct.new(liquidity_pool_use_count: Int32, ext: Ext)

  @type t :: %__MODULE__{liquidity_pool_use_count: Int32.t(), ext: Ext.t()}

  defstruct [:liquidity_pool_use_count, :ext]

  @spec new(liquidity_pool_use_count :: Int32.t(), ext :: Ext.t()) :: t()
  def new(%Int32{} = liquidity_pool_use_count, %Ext{} = ext),
    do: %__MODULE__{liquidity_pool_use_count: liquidity_pool_use_count, ext: ext}

  @impl true
  def encode_xdr(%__MODULE__{liquidity_pool_use_count: liquidity_pool_use_count, ext: ext}) do
    [liquidity_pool_use_count: liquidity_pool_use_count, ext: ext]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{liquidity_pool_use_count: liquidity_pool_use_count, ext: ext}) do
    [liquidity_pool_use_count: liquidity_pool_use_count, ext: ext]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok,
       {%XDR.Struct{components: [liquidity_pool_use_count: liquidity_pool_use_count, ext: ext]},
        rest}} ->
        {:ok, {new(liquidity_pool_use_count, ext), rest}}

      error ->
        error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [liquidity_pool_use_count: liquidity_pool_use_count, ext: ext]},
     rest} = XDR.Struct.decode_xdr!(bytes, struct)

    {new(liquidity_pool_use_count, ext), rest}
  end
end
