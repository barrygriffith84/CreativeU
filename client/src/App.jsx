import React, { useState } from 'react';
import { BrowserRouter as Router } from "react-router-dom";


import { useEffect } from 'react';

import ApplicationViews from './Components/ApplicationViews';
import Authorize from './Authorize';
import { Navbar } from 'reactstrap';

function App() {
    const [isLoggedIn, setIsLoggedIn] = useState(true);
    const [currentUser, setCurrentUser] = useState({})

    const user = localStorage.getItem("userProfile")
    const parsedUser = JSON.parse(user)

    useEffect(() => {
        if (!localStorage.getItem("userProfile")) {
            setIsLoggedIn(false)

        }
    }, [isLoggedIn])

    useEffect(() => {
        if (parsedUser) {
            setCurrentUser(parsedUser)
        }
    }, [isLoggedIn])

    return (
        <Router>
           
            {isLoggedIn ?
             
                <ApplicationViews currentUser={currentUser} />
                :
                <Authorize setIsLoggedIn={setIsLoggedIn} />
            }
        </Router>
    );
}

export default App;
