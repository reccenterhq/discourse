class ThumbnailSerializer < ActiveModel::Serializer
  attributes :feature,
             :large,
             :medium,
             :square,
             :square_small,
             :thumbnail

  def feature
    object.feature.url
  end

  def large
    object.large.url
  end

  def medium
    object.medium.url
  end

  def square
    object.square.url
  end

  def square_small
    object.square_small.url
  end

  def thumbnail
    object.thumbnail.url
  end
end
