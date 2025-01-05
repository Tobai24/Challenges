import React from "react";
import "../src/index.css";
import { Link } from "react-router-dom";
import { useSearchParams } from "react-router-dom";
import { getVans } from "../src/api";

export default function Vans() {
  const [vans, setVans] = React.useState([]);
  const [loading, setLoading] = React.useState(false);
  const [error, setError] = React.useState(null);

  React.useEffect(() => {
    async function loadVans() {
      setLoading(true);
      try {
        const data = await getVans();
        setVans(data);
      } catch (err) {
        setError(err);
      } finally {
        setLoading(false);
      }
    }

    loadVans();
  }, []);

  const [searchParams, setSearchParams] = useSearchParams();

  const typeFilter = searchParams.get("type");

  const filteredVan = typeFilter
    ? vans.filter((el) => el.type === typeFilter)
    : vans;

  const vanElements = filteredVan.map((van) => (
    <div key={van.id} className="van-tile">
      <Link
        to={`${van.id}`}
        state={{ search: `?${searchParams.toString()}`, type: typeFilter }}
      >
        <img alt={van.name} src={van.imageUrl} />
        <div className="van-info">
          <h3>{van.name}</h3>
          <p>
            ${van.price}
            <span>/day</span>
          </p>
        </div>
        <i className={`van-type ${van.type} selected`}>{van.type}</i>
      </Link>
    </div>
  ));

  const getParamKey = (key, value) => {
    const sp = new URLSearchParams(searchParams);
    if (value === null) {
      sp.delete(key);
    } else {
      sp.set(key, value);
    }
    return `?${sp.toString()}`;
  };

  // const getParamKey = (key, value) => {
  //   setSearchParams((sp) => {
  //     if (value === null) {
  //       sp.delete(key);
  //     } else {
  //       sp.set(key, value);
  //     }
  //     return `?${sp.toString()}`;
  //   });
  // };

  if (loading) {
    return <h1>Loading...</h1>;
  }

  if (error) {
    return <h1>There was an error: {error.message}</h1>;
  }
  return (
    <>
      <div className="van-list-filter-buttons">
        {/* <button
          onClick={() => setSearchParams({ type: "simple" })}
          className="van-type simple"
        >
          Simple
        </button> */}
        <Link
          to={getParamKey("type", "simple")}
          className={`van-type simple ${
            typeFilter === "simple" ? "selected" : ""
          }`}
        >
          Simple
        </Link>
        <Link
          to="?type=luxury"
          className={`van-type luxury ${
            typeFilter === "luxury" ? "selected" : ""
          }`}
        >
          Luxury
        </Link>
        <Link
          to="?type=rugged"
          className={`van-type rugged  ${
            typeFilter === "rugged" ? "selected" : ""
          }`}
        >
          Rugged
        </Link>
        {typeFilter ? (
          <Link to="" className="van-type clear-filters">
            Clear
          </Link>
        ) : null}
      </div>
      <div className="van-list-container">
        <h1>Explore our van options</h1>
        <div className="van-list">{vanElements}</div>
      </div>
    </>
  );
}
