const TOKEN_KEY = 'rental_token'
const REFRESH_TOKEN_KEY = 'rental_refresh_token'
const USER_KEY = 'rental_user'
const LOCATION_KEY = 'rental_location'

export function getToken() {
  return localStorage.getItem(TOKEN_KEY)
}

export function setToken(token) {
  localStorage.setItem(TOKEN_KEY, token)
}

export function removeToken() {
  localStorage.removeItem(TOKEN_KEY)
}

export function getRefreshToken() {
  return localStorage.getItem(REFRESH_TOKEN_KEY)
}

export function setRefreshToken(token) {
  localStorage.setItem(REFRESH_TOKEN_KEY, token)
}

export function removeRefreshToken() {
  localStorage.removeItem(REFRESH_TOKEN_KEY)
}

export function getUser() {
  const userStr = localStorage.getItem(USER_KEY)
  return userStr ? JSON.parse(userStr) : null
}

export function setUser(user) {
  localStorage.setItem(USER_KEY, JSON.stringify(user))
}

export function removeUser() {
  localStorage.removeItem(USER_KEY)
}

export function clearAll() {
  removeToken()
  removeRefreshToken()
  removeUser()
}

export function getLocation() {
  const locationStr = localStorage.getItem(LOCATION_KEY)
  return locationStr ? JSON.parse(locationStr) : null
}

export function setLocation(location) {
  localStorage.setItem(LOCATION_KEY, JSON.stringify(location))
}

export function removeLocation() {
  localStorage.removeItem(LOCATION_KEY)
}
