defmodule StellarBase.XDR.SCNonceKey do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `SCNonceKey` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.Int64

  @struct_spec XDR.Struct.new(nonce: Int64)

  @type nonce_type :: Int64.t()

  @type t :: %__MODULE__{nonce: nonce_type()}

  defstruct [:nonce]

  @spec new(nonce :: nonce_type()) :: t()
  def new(%Int64{} = nonce),
    do: %__MODULE__{nonce: nonce}

  @impl true
  def encode_xdr(%__MODULE__{nonce: nonce}) do
    [nonce: nonce]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{nonce: nonce}) do
    [nonce: nonce]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [nonce: nonce]}, rest}} ->
        {:ok, {new(nonce), rest}}

      error ->
        error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [nonce: nonce]}, rest} = XDR.Struct.decode_xdr!(bytes, struct)
    {new(nonce), rest}
  end
end