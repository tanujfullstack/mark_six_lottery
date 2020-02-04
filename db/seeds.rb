#create tickets
t1 = Ticket.create(title: 'ticket_1', winning_amount: 5)
t2 = Ticket.create(title: 'ticket_2', winning_amount: 10)

#create user tickets and draws
u1 = User.create(email: 'test@abc.com', password: '123456')
ut_1 = UserTicket.create(user: u1, ticket: t2)
ut_2 = UserTicket.create(user: u1, ticket: t1)

u2 = User.create(email: 'test1@abc.com', password: '123456')
ut_3 = UserTicket.create(user: u2, ticket: t2)
ut_4 = UserTicket.create(user: u2, ticket: t1)

d1 = Draw.create(title: 'draw_1', winner_user_ticket: ut_2, ticket: t1)
d2 = Draw.create(title: 'draw_2', winner_user_ticket: ut_1, ticket: t2)
d3 = Draw.create(title: 'draw_3', winner_user_ticket: ut_3, ticket: t1)

DrawParticipant.create(draw: d1, user_ticket: ut_1)
DrawParticipant.create(draw: d1, user_ticket: ut_2)
DrawParticipant.create(draw: d1, user_ticket: ut_4)

DrawParticipant.create(draw: d2, user_ticket: ut_1)
DrawParticipant.create(draw: d2, user_ticket: ut_3)
DrawParticipant.create(draw: d2, user_ticket: ut_4)

DrawParticipant.create(draw: d3, user_ticket: ut_1)
DrawParticipant.create(draw: d3, user_ticket: ut_3)
DrawParticipant.create(draw: d3, user_ticket: ut_2)





