function Topbar({ onToggle }) {
  return (
    <div className="bg-light shadow-sm p-3 d-flex align-items-center">
      
      {/* Toggle Button */}
      <button className="btn btn-outline-secondary me-3" onClick={onToggle}>
        ☰
      </button>

      <h5 className="m-0"></h5>
    </div>  
  );
}

export default Topbar;