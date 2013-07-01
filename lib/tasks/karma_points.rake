namespace :karma_points do
  desc "Resave karma points"
  task :seed => :environment do
    User.all.each do |user|
      user.karma_count = KarmaPoint.where(user_id: user.id).sum('value')
      user.save(:validate => false)
    end
  end
end
