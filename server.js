const express = require("express");
const app = express();
const http = require("http");
const { Socket } = require("socket.io");
const server = http.createServer(app);
const cors = require("cors");
const axios = require("axios");
app.use(cors());

const io = require("socket.io")(4001, {
    cors: {
        origin: "*",
    },
    // cors: {
    //     origin: "http://127.0.0.1:8000",
    //     methods: ["GET", "POST"],
    // },
});

app.set("socketIo", io);
app.use(express.json());
app.post("/test", async (req, res) => {
    try {
        // console.log(req.body);
        // const response = await axios.post(
        //     "http://127.0.0.1:8000/api/assessmentresult/add",
        //     req.body
        // );
        // const responseGet = await axios.get(
        //     "http://127.0.0.1:8000/api/assessmentresult"
        // );
        // io.on("connection", (socket) => {
        //     console.log("connection");
        //     io.socket.emit("sendChatToServer", responseGet.data);
        //     socket.on("recviedChatToServer", (message) => {
        //         console.log('SASAASS');
        //         res.json({
        //             msg: "DATA RECEIVING",
        //         });
        //         // io.sockets.emit("sendChatToClient",message)
        //         // socket.broadcast.emit("sendChatToClient",message)
        //     });
        //     socket.on("disconnect", (socket) => {
        //         console.log("disconnection");
        //     });
        // });
        // let users = [];
        // const addUser = (userId, socketId) => {
        //     !users.some((user) => {
        //         user.userId == userId;
        //     });
        //     users.push({ userId, socketId });
        // };
        // const removeUser = (socketId) => {
        //     users = users.filter((user) => user.socketId !== socketId);
        // };
        // const getuser = (userId) => {
        //     return users.find((user) => user.userId == userId);
        // };
        // const socketConnection = (io) => {
        //     io.on("connection", (socket) => {
        //         socket.on("addUser", (userId) => {
        //             console.log("ADD User");
        //             addUser(userId, socket.id);
        //             io.emit("getusers", users);
        //         });
        //         socket.on(
        //             "sendMessage",
        //             ({ senderId, receiverId, text, id }) => {
        //                 const user = getuser(receiverId);
        //                 io.to(user?.socketId).emit("getMessage", {
        //                     id,
        //                     senderId,
        //                     text,
        //                 });
        //             }
        //         );
        //         socket.on("disconnect", () => {
        //             removeUser(socket.id);
        //             io.emit("getusers", users);
        //         });
        //     });
        // };
    } catch (err) {
        console.log(err);
    }
});

let users = [];
const addUser = (userId, socketId) => {
    !users.some((user) => {
        user.userId == userId;
    });
    users.push({ userId, socketId });
};
const removeUser = (socketId) => {
    users = users.filter((user) => user.socketId !== socketId);
};
const getuser = (userId) => {
    return users.find((user) => user.userId == userId);
};

const socketConnection = (io) => {
    io.on("connection", (socket) => {
        socket.on("addUser", (userId) => {
            console.log("ADD User");
            addUser(userId, socket.id);
            io.emit("getusers", users);
        });
        socket.on("sendMessage", ({ senderId, receiverId, text, id }) => {
            const user = getuser(receiverId);
            io.to(user?.socketId).emit("getMessage", {
                id,
                senderId,
                text,
            });
        });
        socket.on("disconnect", () => {
            removeUser(socket.id);
            io.emit("getusers", users);
        });
    });
};l

// app.get("/getRecord", async (req, res) => {
//     try {
//         console.log(req.body)
//         const response = await axios.post("http://127.0.0.1:8000/api/assessmentresult/add",req.body)

//         req.socket.emit('sendChatToServer', response.data);
//         res.json(response.data)

//     }
//     catch (err) {
//         console.log(err)
//     }
// })

socketConnection(io);
server.listen(4000, () => {
    console.log("listening on *:4000");
});
