class AddColumnEducationalAndAddressAndPoliticalStatusAndDrivingLicenseAndDrivingAgeAndEvaluationToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :educational, :string
    add_column :resumes, :address, :string
    add_column :resumes, :political_status, :string
    add_column :resumes, :driving_license, :string
    add_column :resumes, :driving_age, :integer
    add_column :resumes, :evaluation, :text
  end
end
