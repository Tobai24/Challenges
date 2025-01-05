import { NavLink, Outlet } from "react-router-dom";

export default function HostLayout() {
  const style = {
    fontWeight: "bold",
    textDecoration: "underline",
    color: "#161616",
  };
  return (
    <>
      <nav className="host-nav">
        <NavLink
          to="/host"
          end
          style={({ isActive }) => (isActive ? style : null)}
        >
          Dashboard
        </NavLink>
        <NavLink
          to="income"
          style={({ isActive }) => (isActive ? style : null)}
        >
          Income
        </NavLink>
        <NavLink to="vans" style={({ isActive }) => (isActive ? style : null)}>
          Vans
        </NavLink>
        <NavLink
          to="review"
          style={({ isActive }) => (isActive ? style : null)}
        >
          Review
        </NavLink>
      </nav>
      <Outlet />
    </>
  );
}
