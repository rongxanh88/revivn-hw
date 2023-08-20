import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { useEffect, useState } from 'react'

export default function Pickups() {
  const [pickups, setPickups] = useState(() => [])

  useEffect(() => {
    const getData = async () => {
      const query = await fetch("http://localhost:3001/pickups")
      const response = await query.json()
      setPickups(response)
      console.log('response', response)
    }

    getData()
  }, [])

  return (
    <div className="App">
      <div>
        <div className="PickupWrapper">
        <h1>Pickup List</h1>
          {pickups.map(item => (
            <div className="Pickup" key={item.id}>
              <p>ID: {item.id}</p>
              <p>Address: {item.address}</p>
              <p>Secondary Address: {item.secondary_address}</p>
              <p>City: {item.city}</p>
              <p>State: {item.state}</p>
              <p>Zip Code: {item.zip_code}</p>
              <p>Status: {item.status}</p>
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}
