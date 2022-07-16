const { User } = require("../models");
const bcrypt = require("bcryptjs");

const authController = {
  showLogin: (req, res) => {
    return res.render("auth/login");
  },

  showRegister: (req, res) => {
    return res.render("auth/register");
  },

  store: async (req, res) => {
    try {
      const { email, name, username, password } = req.body;

      const verifyUser = await User.findOne({ where: { email } });

      if (verifyUser) {
        return res.render("auth/register", { error: "Não foi possível realizar o cadastro" });
      }

      const hash = bcrypt.hashSync(password, 10);

      const user = await User.create({
        email,
        name,
        username,
        password: hash
      })

      console.log(user);
      return res.redirect("/home");
    }catch (error) {
      console.log(error);
      return res.render("auth/register", { error: "Sistema Indisponível" })
    }

  }

};

module.exports = authController;
