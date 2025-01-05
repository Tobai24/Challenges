import { NavLink, Link } from "react-router-dom";

const Header = () => {
  const style = {
    fontWeight: "bold",
    color: "#161616",
    textDecoration: "underline",
  };
  return (
    <header>
      <Link className="site-logo" to="/">
        #VanLife
      </Link>
      <nav>
        <NavLink
          to="/about"
          style={({ isActive }) => (isActive ? style : null)}
        >
          About
        </NavLink>
        <NavLink to="/vans" style={({ isActive }) => (isActive ? style : null)}>
          Vans
        </NavLink>
        <NavLink to="/host" style={({ isActive }) => (isActive ? style : null)}>
          Host
        </NavLink>
      </nav>
    </header>
  );
};

export default Header;
