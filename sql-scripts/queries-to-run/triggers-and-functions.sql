/*Function to update the column last_update whenever any update happens on already existing rows*/
CREATE FUNCTION public.update_lastupdate() RETURNS TRIGGER AS $$
BEGIN
    UPDATE customer SET last_update=now() WHERE customerid=NEW.customerid;
    RETURN NEW;
END; $$
LANGUAGE plpgsql;


/*Trigger to update the column last_update whenever any update happens on already existing rows*/
CREATE TRIGGER lastupdatedateTrigger
AFTER UPDATE ON public.customer
FOR EACH ROW WHEN (pg_trigger_depth() < 1) EXECUTE FUNCTION update_lastupdate();


