const baseUrl = 'https://localhost:7293/api/UserProfile';


export const getUserById = (id) => {
    return fetch(`${baseUrl}/GetUserById/${id}`).then((res) => res.json());
};

export const login = (userObject) => {
    return fetch(`${baseUrl}/getbyemail?email=${userObject.email}`)
      .then((r) => r.json())
      .then((userProfile) => {
        if (userProfile.id) {
          localStorage.setItem("userProfile", JSON.stringify(userProfile));
          
          return userProfile;
        } else {
          return undefined;
        }
      });
  };
  
  export const logout = () => {
        localStorage.clear()
  };