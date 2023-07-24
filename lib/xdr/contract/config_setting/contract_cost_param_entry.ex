defmodule StellarBase.XDR.ContractCostParamEntry do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `ContractCostParamEntry` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    ExtensionPoint,
    Int64
  }

  @struct_spec XDR.Struct.new(
                 ext: ExtensionPoint,
                 const_term: Int64,
                 linear_term: Int64
               )

  @type ext_type :: ExtensionPoint.t()
  @type const_term_type :: Int64.t()
  @type linear_term_type :: Int64.t()

  @type t :: %__MODULE__{
          ext: ext_type(),
          const_term: const_term_type(),
          linear_term: linear_term_type()
        }

  defstruct [:ext, :const_term, :linear_term]

  @spec new(ext :: ext_type(), const_term :: const_term_type(), linear_term :: linear_term_type()) ::
          t()
  def new(
        %ExtensionPoint{} = ext,
        %Int64{} = const_term,
        %Int64{} = linear_term
      ),
      do: %__MODULE__{ext: ext, const_term: const_term, linear_term: linear_term}

  @impl true
  def encode_xdr(%__MODULE__{ext: ext, const_term: const_term, linear_term: linear_term}) do
    [ext: ext, const_term: const_term, linear_term: linear_term]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{ext: ext, const_term: const_term, linear_term: linear_term}) do
    [ext: ext, const_term: const_term, linear_term: linear_term]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok,
       {%XDR.Struct{components: [ext: ext, const_term: const_term, linear_term: linear_term]},
        rest}} ->
        {:ok, {new(ext, const_term, linear_term), rest}}

      error ->
        error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [ext: ext, const_term: const_term, linear_term: linear_term]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)

    {new(ext, const_term, linear_term), rest}
  end
end