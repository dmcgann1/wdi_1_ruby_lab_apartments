class Apartment
  attr_accessor :number, :rent, :square_ft, :beds, :baths
  attr_reader :tenants

  def initialize(number:, rent:, square_ft:, beds:, baths:)
    @number, @rent, @square_ft, @beds, @baths, @tenants = number, rent, square_ft, beds, baths, []
  end

  def add_tenant(prospect)
    #prospect.credit_rating != "bad" && beds - tenants.count != 0 ? tenants << prospect : raise "cannot add tenant"
    if prospect.credit_rating != 'bad' && tenants.count < beds
      tenants << prospect
    else
      raise "Cannot add tenant"
    end
  end

  def remove_tenant(name)
    tenants.delete_if {|tenant| tenant.name == name}
  end

  def clear_tenants
    tenants.clear
  end

  def average_score
    tenants.map(&:credit_score).reduce(0, :+) / tenants.count
  end

  #refactor opportunity?
  def credit_rating
    if average_score >= 760
      "excellent"
    elsif average_score >= 725
      "great"
    elsif average_score >= 660
      "good"
    elsif average_score >= 560
      "mediocre"
    else
      "bad"
    end
  end

end
