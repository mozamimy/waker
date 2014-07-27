module Api
  class ProvidersController < ApplicationController
    before_action :set_provider, only: [:show, :edit, :update, :destroy]

    def index
      @providers = Provider.all
      respond_with(:api, @providers)
    end

    def show
      respond_with(:api, @provider)
    end

  #  def new
  #    @provider = Provider.new
  #    respond_with(:api, @provider)
  #  end
  #
  #  def edit
  #  end

    def create
      @provider = Provider.new(provider_params)
      @provider.save
      respond_with(:api, @provider)
    end

    def update
      @provider.update(provider_params)
      respond_with(:api, @provider)
    end

    def destroy
      @provider.destroy
      respond_with(:api, @provider)
    end

    private
      def set_provider
        @provider = Provider.find(params[:id])
      end

      def provider_params
        provider = params.require(:provider)
        provider.permit(:name, :kind, :escalation_rule_id).tap do |permitted|
          permitted[:details] = provider[:details]
        end
      end
  end
end
