# Project: Glamming_glow
Home-service beauty booking app.

## Users
1. Customer: books services
2. Beautician: accepts and completes jobs
3. Admin: manages services and bookings

## Main flow
Customer picks service → picks time → pays → beautician accepts →
beautician arrives (OTP verified) → service done → customer rates.

## MVP features
Customer: sign up, browse services, book a slot, pay, track status, rate
Beautician: see assigned bookings, accept, start, complete
Admin: add/edit services, view bookings

## NOT in MVP
ML assignment, barcode scanning, chat, multiple cities, wallet.

## Booking states
pending → confirmed → en_route → in_progress → completed → rated
(cancelled can happen from pending or confirmed)
