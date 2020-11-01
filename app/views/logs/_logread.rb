<ul>
    <li><%= "Worked Out: #{@log.worked_out}" %></li>
    <li><%= "Tracked Food: #{@log.tracked_food}" %></li>
    <li><%= "Weight: #{@log.weight}" %></li>
    <li><%= "Body Fat %: #{@log.body_fat}" %></li>
    <li><%= "Active Calories: #{@log.active_calories}" %></li>
    <li><%= "Calories: #{@log.calories}" %></li>
    <% @log.user.log_scores.where(log_id: @log.id).each do |ls| %>
        <li><%= "#{ls.challenge_goal.challenge.name} - Total Points - #{ls.total_points}" %></li>
    <% end %>
</ul>