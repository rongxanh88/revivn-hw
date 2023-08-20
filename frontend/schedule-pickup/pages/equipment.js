import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faTrash } from '@fortawesome/free-solid-svg-icons'
import { useEffect, useState } from 'react'
import Link from 'next/link'

export default function Equipment() {
  const [equipment, setEquipment] = useState(() => [])

  useEffect(() => {
    const getData = async () => {
      const query = await fetch("http://localhost:3001/equipment")
      const response = await query.json()
      setEquipment(response)
    }

    getData()
  }, [])

  return (
    <div className="App">
      <div>
        <div className="EquipmentWrapper">
        <h1>Equipment List</h1>
          {equipment.map(item => (
            <div className="Equipment" key={item.id}>
              <p>ID: {item.id}</p>
              <p>Manufacturer: {item.manufacturer}</p>
              <p>Model: {item.model}</p>
              <p>Serial Number: {item.serial_number}</p>
              <Link href={`/equipment/schedule-pickup?equipment_id=${item.id}`}><FontAwesomeIcon icon={faTrash} /></Link>
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}
