class AwardsController < InheritedResources::Base

  private

    def award_params
      params.require(:award).permit(:award, :subheading, :page_description, :is_active)
    end
end

