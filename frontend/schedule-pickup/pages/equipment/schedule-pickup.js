import { useState } from 'react'
import { useRouter } from 'next/router';
import Link from 'next/link'

export default function SchedulePickup() {
  const [address, setAddress] = useState('')
  const [address_2, setAddress_2] = useState('')
  const [city, setCity] = useState('')
  const [state, setState] = useState('')
  const [zip_code, setZip_code] = useState('')

  const router = useRouter();
  const { equipment_id } = router.query;

  const handleSubmit = async (e) => {
    e.preventDefault()

    const data = {
      address,
      address_2,
      city,
      state,
      zip_code
    }

    const response = await fetch(`http://localhost:3001/equipment/${equipment_id}/pickups`, {
      method: 'POST',
      body: JSON.stringify(data),
      headers: {
        'Content-Type': 'application/json'
      }
    })

    if (response.status === 201) {
      alert('Pickup scheduled successfully!')
    } else {
      alert('Something went wrong. Please try again.')
    }
  }

  return (
    <div className="App">
      <div>
        <div className="EquipmentWrapper">
        <h1>Schedule Pickup</h1>
          <form onSubmit={handleSubmit}>
            <input type="text" name="address" value={address} onChange={(e) => setAddress(e.target.value)} placeholder="Address" />
            <input type="text" name="address_2" value={address_2} onChange={(e) => setAddress_2(e.target.value)} placeholder="Address 2" />
            <input type="text" name="city" value={city} onChange={(e) => setCity(e.target.value)} placeholder="City" />
            <input type="text" name="state" value={state} onChange={(e) => setState(e.target.value)} placeholder="State" />
            <input type="text" name="zip_code" value={zip_code} onChange={(e) => setZip_code(e.target.value)} placeholder="Zip Code" />
            <button type="submit">Schedule Pickup</button>
          </form>
          <div>
          <Link href='/pickups'>Show All Pickups</Link>
          </div>
        </div>
      </div>
    </div>
  )
}
