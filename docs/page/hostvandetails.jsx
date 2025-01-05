import { useOutletContext } from "react-router-dom";

const HostVandetails = () => {
  const { currentVan } = useOutletContext();
  return (
    <section className="host-van-detail-info">
      <h4>
        Name: <span>{currentVan.name}</span>
      </h4>
      <h4>
        Category: <span>{currentVan.type}</span>
      </h4>
      <h4>
        Description: <span>{currentVan.description}</span>
      </h4>
      <h4>
        Visibility: <span>Public</span>
      </h4>
    </section>
  );
};

const HostVandetailsPrice = () => {
  const { currentVan } = useOutletContext();
  return (
    <>
      <h3 className="host-van-price">
        ${currentVan.price}
        <span>/day</span>
      </h3>
    </>
  );
};

const HostVandetailsPhoto = () => {
  const { currentVan } = useOutletContext();
  return (
    <>
      <img src={currentVan.imageUrl} className="host-van-detail-image" />
    </>
  );
};

export default HostVandetails;
export { HostVandetailsPrice };
export { HostVandetailsPhoto };
