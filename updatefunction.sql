create or replace function updatePost
(pidVal int, contentVal text, emailVal text, tagidVal int,addressVal text, starttimeVal text, endtimeVal text) returns boolean as $$
begin
    if starttimeVal != 'null' and endtimeVal != 'null' then
    UPDATE posts set content = contentVal,
                                             email = emailVal,
                                             tagid = tagidVal,
                                             address = addressVal,
                                             starttime = starttimeVal,
                                             endtime = endtimeVal where pid = pidVal;
    return true;
    elseif starttimeVal != 'null' and endtimeVal = 'null' then
    UPDATE posts set content = contentVal,
                                             email = emailVal,
                                             tagid = tagidVal,
                                             address = addressVal,
                                             starttime = starttimeVal
			    																		where pid = pidVal;
    return true;
    elseif starttimeVal = 'null' and endtimeVal != 'null' then
    UPDATE posts set content = contentVal,
                                             email = emailVal,
                                             tagid = tagidVal,
                                             address = addressVal,
                                             endtime = endtimeVal
			    																		where pid = pidVal;
    return true;
end
if;
				return false;
end;
  $$ language plpgsql;