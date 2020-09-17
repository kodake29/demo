class MembersController < ApplicationController
  def show
  	@member = current_member
  end

  def edit
  	@member = current_member
  end

    def update
    @member = current_member
    if @member.update(member_params)
      redirect_to member_path(@member), success: 'お客様情報が更新されました！'
    else
      flash[:danger] = 'お客様の情報を更新出来ませんでした。空欄の箇所はありませんか？'
      render :edit
    end
  end

   private

  def member_params
    params.require(:member).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :email, :phone)
  end
end
