class DataStore
  def initialize(pdf:)
    @aws = Aws::Connect
    @pdf = pdf
  end

  def upload_pdf pdf
    unless already_in_s3?
      @aws.upload_to_bucket(
        bucket: @operation || @category,
        key: @pdf.filename,
        body: @pdf
      )
    end
  end

  private
  def already_in_s3?
    @aws.find_in_bucket(
      bucket: @operation || @category,
      key: @pdf.filename
    )
  end
end