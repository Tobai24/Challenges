import ReactDOM from "react-dom/client";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Home from "../page/Home";
import About from "../page/About";
import Vans from "../page/Vans";
import VanDetails from "../page/Van_details";
import Layout from "../component/layout";
import Dashboard from "../page/dashboard";
import Income from "../page/income";
import Reviews from "../page/reviews";
import HostLayout from "../component/host_layout";
import { Van } from "../page/van";

import "./Server";
import HostVans from "../page/van";
import HostVandetails, {
  HostVandetailsPrice,
  HostVandetailsPhoto,
} from "../page/hostvandetails";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Layout />}>
          <Route index element={<Home />} />
          <Route path="about" element={<About />} />
          <Route path="vans" element={<Vans />} />
          <Route path="vans/:id" element={<VanDetails />} />

          <Route path="host" element={<HostLayout />}>
            <Route index element={<Dashboard />} />
            <Route path="income" element={<Income />} />
            <Route path="review" element={<Reviews />} />
            <Route path="vans" element={<HostVans />} />

            <Route path="vans/:id/" element={<Van />}>
              <Route index element={<HostVandetails />} />
              <Route path="pricing" element={<HostVandetailsPrice />} />
              <Route path="photos" element={<HostVandetailsPhoto />} />
            </Route>
          </Route>
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

ReactDOM.createRoot(document.getElementById("root")).render(<App />);
