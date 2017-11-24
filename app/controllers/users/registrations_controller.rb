class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super do |resource|
      @viewData = {
          "handicappedies" => [
              ["上肢", "上肢"],
              ["下肢", "下肢"],
              ["上下肢", "上下肢"],
              ["体幹", "体幹"],
              ["視覚", "視覚"],
              ["聴覚", "聴覚"],
              ["言語/そしゃく", "言語/そしゃく"],
              ["心臓", "心臓"],
              ["腎臓", "腎臓"],
              ["ぼうこうもしくは直腸", "ぼうこうもしくは直腸"],
              ["小腸", "小腸"],
              ["肝臓", "肝臓"],
              ["呼吸器", "呼吸器"],
              ["免疫不全", "免疫不全"],
              ["身体障がいその他", "身体障がいその他"],
              ["てんかん", "てんかん"],
              ["うつ"],
              ["躁うつ（双極生）", "躁うつ（双極生）"],
              ["統合失調症", "統合失調症"],
              ["神経症・不安障がい", "神経症・不安障がい"],
              ["適応障がい", "適応障がい"],
              ["精神障がいその他", "精神障がいその他"],
              ["高機能自閉症・アスペルガー症候群", "高機能自閉症・アスペルガー症候群"],
              ["注意欠陥/多動性障がい(ADHD)", "注意欠陥/多動性障がい(ADHD)"],
              ["学習障がい(LD)", "学習障がい(LD)"],
              ["その他の発達障がい", "その他の発達障がい"],
              ["人格障がい", "人格障がい"],
              ["解離性障がい", "解離性障がい"],
              ["知的", " 知的"]
          ],
          "levels" => [
              ["1級", "1級"],
              ["2級", "2級"],
              ["3級", "3級"],
              ["4級", "4級"],
              ["5級", "5級"],
              ["6級", "6級"],
              ["7級", "7級"],
              ["A", "A"],
              ["B", "B"],
              ["C", "C"],
              ["取得予定", "取得予定"]
          ]
      }
    end
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :sex, :birthday, :phone_number, :cell_phone_number, :employed_status, :first_handicapped_part, :first_handicapped_level, :second_handicapped_part, :second_handicapped_level])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    root_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
