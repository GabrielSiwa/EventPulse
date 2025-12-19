# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Seed 3 posts
Post.find_or_create_by!(title: "Welcome to EventPulse") do |post|
  post.body = <<~HTML
    <p><strong>EventPulse</strong> is the ultimate platform for discovering and sharing events. Whether you're looking for tech conferences, music festivals, networking events, or community gatherings, we've got you covered.</p>
    <p style="margin-top: 1rem;">Our mission is to make event discovery simple and enjoyable. With our RSS feed integration, you'll never miss an event that matters to you.</p>
    <p style="margin-top: 1rem;">Get started today by subscribing to our feed and exploring the latest events in your area!</p>
  HTML
  post.published_at = 2.days.ago
  post.url = "https://eventpulse.example.com/welcome"
end

Post.find_or_create_by!(title: "Announcing New Features") do |post|
  post.body = <<~HTML
    <p>We're thrilled to announce several groundbreaking new features that will revolutionize your event management experience:</p>
    <ul style="margin-top: 1rem; margin-left: 2rem;">
      <li><strong>Smart Event Recommendations:</strong> Our AI learns your preferences and suggests events you'll love</li>
      <li><strong>Advanced Filtering:</strong> Filter by date, location, category, and more</li>
      <li><strong>Social Sharing:</strong> Share events with friends directly from EventPulse</li>
      <li><strong>Calendar Integration:</strong> Sync events directly to your calendar</li>
    </ul>
    <p style="margin-top: 1rem;">Check out what's new in our latest release and take your event experience to the next level!</p>
  HTML
  post.published_at = 1.day.ago
  post.url = nil
end

Post.find_or_create_by!(title: "Community Spotlight: December Events") do |post|
  post.body = <<~HTML
    <p>This week we're featuring some amazing events from our community. From tech conferences to music festivals, there's something for everyone:</p>
    <p style="margin-top: 1rem;"><strong>🎸 Music & Culture:</strong> Don't miss the winter music festival featuring local and international artists</p>
    <p style="margin-top: 0.5rem;"><strong>💻 Tech & Innovation:</strong> Join us for the Annual Tech Summit with talks from industry leaders</p>
    <p style="margin-top: 0.5rem;"><strong>🤝 Networking:</strong> Connect with professionals at our monthly networking mixer</p>
    <p style="margin-top: 0.5rem;"><strong>🎨 Arts & Creative:</strong> Explore emerging artists at the Holiday Art Showcase</p>
    <p style="margin-top: 1rem;">Don't miss out on these incredible opportunities! Follow us to stay updated on all upcoming events.</p>
  HTML
  post.published_at = 6.hours.ago
  post.url = "https://blog.eventpulse.example.com/spotlight"
end
