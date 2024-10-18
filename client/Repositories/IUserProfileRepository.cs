using CreativeU.Models;

namespace CreativeU.Repositories
{
    public interface IUserProfileRepository
    {
        void Add(UserProfile userProfile);
        void Delete(int id);
        List<UserProfile> GetAll();
        UserProfile GetByEmail(string email);
        UserProfile GetById(int id);
        void Update(UserProfile userProfile);

    }
}