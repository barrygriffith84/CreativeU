-- Seed UserType
INSERT INTO [UserType] ([Name])
VALUES
  ('Admin'),
  ('Author'),
  ('Subscriber');

-- Seed UserProfile
INSERT INTO [UserProfile] ([DisplayName], [FirstName], [LastName], [Email], [CreateDateTime], [ImageLocation], [UserTypeId])
VALUES
  ('admin_user', 'Admin', 'User', 'admin@example.com', GETDATE(), 'images/admin.png', 1),
  ('john_doe', 'John', 'Doe', 'john@example.com', GETDATE(), 'images/john.png', 2),
  ('jane_smith', 'Jane', 'Smith', 'jane@example.com', GETDATE(), 'images/jane.png', 2),
  ('subscriber_one', 'Subscriber', 'One', 'subscriber1@example.com', GETDATE(), 'images/subscriber1.png', 3);

-- Seed Category
INSERT INTO [Category] ([Name])
VALUES
  ('Baking'),
  ('Crochet'),
  ('Archery'),
  ('Chess'),
  ('Art');

-- Seed Post
INSERT INTO [Post] ([Title], [Content], [ImageLocation], [CreateDateTime], [PublishDateTime], [IsApproved], [CategoryId], [UserProfileId])
VALUES
  ('Baking', 'This post is all about baking! Here are some resources to get you started.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0J-znN5s-N7DsWW6B827aknUpk8J6sehbxw&s', GETDATE(), GETDATE(), 1, 1, 2),
  ('Crochet', 'Crochet is a lifestyle.', 'https://images.squarespace-cdn.com/content/v1/62adb25086a91b0f0f372f8b/2fbe24a4-efa2-43bf-8699-cf9377b7b427/IMG_3600+3.jpg', GETDATE(), GETDATE(), 1, 2, 3),
  ('Stained glass', 'Listed below are all the supplies you ', 'https://linebaughstudios.com/cdn/shop/files/IMG_9393.jpg?v=1719506998', GETDATE(), GETDATE(), 1, 4, 2),
  ('Bookbinding', 'Bookbinding is a very time consuming yet rewarding hobby!', 'https://m.media-amazon.com/images/I/61MAInWvyKL._AC_UF1000,1000_QL80_.jpg', GETDATE(), GETDATE(), 1, 5, 3);

-- Seed Comment
INSERT INTO [Comment] ([PostId], [UserProfileId], [Subject], [Content], [CreateDateTime])
VALUES
  (1, 4, 'Great Insights!', 'I really enjoyed the video.', GETDATE()),
  (2, 1, 'Helpful Tips', 'Thanks for sharing these tips!', GETDATE()),
  (3, 2, 'I love the first picture!', 'Can you share the pattern?', GETDATE()),
  (4, 3, 'This hobby looks awesome!', 'How much would you say it costs to get all the basic supplies?', GETDATE());

-- Seed Subscription
INSERT INTO [Subscription] ([SubscriberUserProfileId], [ProviderUserProfileId], [BeginDateTime], [EndDateTime])
VALUES
  (4, 2, GETDATE(), DATEADD(year, 1, GETDATE())), -- Subscriber One subscribes to John Doe
  (4, 3, GETDATE(), DATEADD(year, 1, GETDATE())); -- Subscriber One subscribes to Jane Smitha
