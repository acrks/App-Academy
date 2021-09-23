const BenchIndexItem = ({bench}) => {
    return (
        <li>
            <h3>{bench.description}</h3>
            Latitude:
            <p>{bench.lat}</p>
            Longitude:
            <p>{bench.lng}</p>
        </li>
    )
    }