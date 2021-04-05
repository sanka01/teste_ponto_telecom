class PedidosController < ApplicationController
  before_action :set_pedido, only: %i[ show edit update destroy ]
  before_action :set_params, only: %i[create new edit]
  # GET /pedidos or /pedidos.json
  def index
    @pedidos = Pedido.all
  end

  # GET /pedidos/1 or /pedidos/1.json
  def show
    @produtos = ProdutosPedido.where(pedido: @pedido)
    
  end

  # GET /pedidos/new
  def new
    
   
    @pedido = Pedido.new
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos or /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)
    i = 0
    flag_save = false
    flag_save = @pedido.save
    valor_total = 0
    while i < @produtos.length do
      qtd = params["produtos"]["quantidade"+ i.to_s].to_i
      if qtd > 0
        p = Produto.find params["produtos"]["id"+i.to_s].to_i
        produto = ProdutosPedido.new()
        produto.quantidade = qtd
        produto.produto = p
        produto.pedido = @pedido
        produto.save
        valor_total += p.valor * qtd
      end
      i = i + 1

    end
    
    @pedido.update(valor_total: valor_total)
    respond_to do |format|
      if flag_save
        format.html { redirect_to @pedido, notice: "Pedido was successfully created." }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1 or /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: "Pedido was successfully updated." }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1 or /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: "Pedido was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    def set_params
      @clientes = Cliente.where(ativo: true)
      @produtos = Produto.where(ativo: true)
    end

    # Only allow a list of trusted parameters through.
    def pedido_params
      params.require(:pedido).permit(:cliente_id, :valor_total)
    end
end
