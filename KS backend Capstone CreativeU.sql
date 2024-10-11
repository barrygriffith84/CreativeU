CREATE TABLE [Post] (
  [Id] int PRIMARY KEY IDENTITY,
  [Title] nvarchar(255),
  [Content] text,
  [ImageLocation] nvarchar(255),
  [CreateDateTime] datetime,
  [PublishDateTime] datetime,
  [IsApproved] bit,
  [CategoryId] int,
  [UserProfileId] int
)
GO

CREATE TABLE [Category] (
  [Id] int PRIMARY KEY IDENTITY,
  [Name] nvarchar(50)
)
GO

CREATE TABLE [Comment] (
  [Id] int PRIMARY KEY IDENTITY,
  [PostId] int,
  [UserProfileId] int,
  [Subject] nvarchar(255),
  [Content] text,
  [CreateDateTime] datetime
)
GO

CREATE TABLE [Subscription] (
  [Id] int PRIMARY KEY IDENTITY,
  [SubscriberUserProfileId] int,
  [ProviderUserProfileId] int,
  [BeginDateTime] datetime,
  [EndDateTime] datetime
)
GO

CREATE TABLE [UserProfile] (
  [Id] int PRIMARY KEY IDENTITY,
  [DisplayName] nvarchar(50),
  [FirstName] nvarchar(50),
  [LastName] nvarchar(50),
  [Email] nvarchar(255),
  [CreateDateTime] datetime,
  [ImageLocation] nvarchar(255),
  [UserTypeId] int
)
GO

CREATE TABLE [UserType] (
  [Id] int PRIMARY KEY IDENTITY,
  [Name] nvarchar(20)
)
GO

ALTER TABLE [Post] ADD FOREIGN KEY ([Id]) REFERENCES [Comment] ([UserProfileId])
GO

ALTER TABLE [UserProfile] ADD FOREIGN KEY ([Id]) REFERENCES [Comment] ([UserProfileId])
GO

ALTER TABLE [Post] ADD FOREIGN KEY ([UserProfileId]) REFERENCES [UserProfile] ([Id])
GO

ALTER TABLE [Category] ADD FOREIGN KEY ([Id]) REFERENCES [Post] ([CategoryId])
GO

ALTER TABLE [Subscription] ADD FOREIGN KEY ([SubscriberUserProfileId]) REFERENCES [UserProfile] ([Id])
GO

ALTER TABLE [Subscription] ADD FOREIGN KEY ([ProviderUserProfileId]) REFERENCES [UserProfile] ([Id])
GO

ALTER TABLE [UserProfile] ADD FOREIGN KEY ([UserTypeId]) REFERENCES [UserType] ([Id])
GO
