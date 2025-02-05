import { useParams } from "react-router-dom";
import { useEffect, useState } from "react";
import { Link, useLocation } from "react-router-dom";

export default function VanDetails() {
  const param = useParams();
  const [van, setVan] = useState(null);
  const location = useLocation();

  useEffect(() => {
    fetch(`/api/vans/${param.id}`)
      .then((res) => res.json())
      .then((data) => setVan(data.vans));
  }, [param.id]);

  const search = location.state?.search || "";
  const type = location.state?.type || "";

  return (
    <div className="van-detail-container">
      <Link to={`..${search}`} relative="path" className="back-button">
        &larr; <span>Back to all {type}</span>
      </Link>
      {van ? (
        <div className="van-detail">
          <img alt={van.name} src={van.imageUrl} />
          <i className={`van-type ${van.type} selected`}>{van.type}</i>
          <h2>{van.name}</h2>
          <p className="van-price">
            <span>${van.price}</span>/day
          </p>
          <p>{van.description}</p>
          <button className="link-button">Rent this van</button>
        </div>
      ) : (
        <h2>Loading...</h2>
      )}
    </div>
  );
}
