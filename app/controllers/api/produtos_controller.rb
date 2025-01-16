class Api::ProdutosController < ApplicationController

    def index
        @produtos = Produto.all
        render json: @produtos, include: ['images']
    end
  
      # Exibir um produto específico
    def show
        @produto = Produto.find(params[:id])
        render json: @produto, include: ['images']
    end
  
      # Criar um novo produto
    def create
        @produto = Produto.new(produto_params)
  
        if @produto.save
          render json: @produto, status: :created
        else
          render json: { errors: @produto.errors.full_messages }, status: :unprocessable_entity
        end
    end
  
      # Atualizar um produto existente
    def update
        @produto = Produto.find(params[:id])
  
        if @produto.update(produto_params)
          render json: @produto
        else
          render json: { errors: @produto.errors.full_messages }, status: :unprocessable_entity
        end
    end
  
    private
  
      # Parâmetros permitidos
    def produto_params
        params.require(:produto).permit(:nome, :descricao, :preco, :estoque, images: [])
    end
end
