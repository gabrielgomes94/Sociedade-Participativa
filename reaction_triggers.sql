-----------------------------
---------Question
-----------------------------

CREATE OR REPLACE FUNCTION question_reactions_tg_function() RETURNS trigger as $$
BEGIN
	IF(TG_OP = 'INSERT') THEN
		IF(NEW.reaction = 'like') THEN
			UPDATE questions SET upvotes = upvotes + 1 WHERE id = NEW.question_id;
		ELSIF(NEW.reaction = 'dislike') THEN
			UPDATE questions SET downvotes = downvotes + 1 WHERE id = NEW.question_id;
		END IF;
		RETURN NEW;
	END IF;
	IF(TG_OP = 'UPDATE') THEN
		IF(NEW.reaction = 'like') THEN
			UPDATE questions SET upvotes = upvotes + 1 WHERE id = 	OLD.question_id;
			UPDATE questions SET downvotes = downvotes - 1 WHERE id = OLD.question_id;
		ELSIF(NEW.reaction = 'dislike') THEN
			UPDATE questions SET upvotes = upvotes - 1 WHERE id = 	OLD.question_id;
			UPDATE questions SET downvotes = downvotes + 1 WHERE id = OLD.question_id;
		END IF;
		RETURN NEW;
	END IF;
	IF(TG_OP = 'DELETE') THEN
		IF(OLD.reaction = 'like') THEN
			UPDATE questions SET upvotes = upvotes - 1 WHERE id = NEW.question_id;			
		ELSIF(OLD.reaction = 'dislike') THEN
			UPDATE questions SET downvotes = downvotes - 1 WHERE id = NEW.question_id;
		END IF;
		RETURN OLD;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;
------
CREATE TRIGGER question_reactions_tg
AFTER INSERT OR UPDATE OR DELETE ON question_reactions
FOR EACH ROW EXECUTE PROCEDURE question_reactions_tg_function();
---------------------------
-------- Propostas
---------------------------
CREATE OR REPLACE FUNCTION proposal_reactions_tg_function() RETURNS trigger as $$
BEGIN
	IF(TG_OP = 'INSERT') THEN
		IF(NEW.reaction = 'like') THEN
			UPDATE proposals SET upvotes = upvotes + 1 WHERE id = NEW.proposal_id;
		ELSIF(NEW.reaction = 'dislike') THEN
			UPDATE proposals SET downvotes = downvotes + 1 WHERE id = NEW.proposal_id;
		END IF;
		RETURN NEW;
	END IF;
	IF(TG_OP = 'UPDATE') THEN
		IF(NEW.reaction = 'like') THEN
			UPDATE proposals SET upvotes = upvotes + 1 WHERE id = 	OLD.proposal_id;
			UPDATE proposals SET downvotes = downvotes - 1 WHERE id = OLD.proposal_id;
		ELSIF(NEW.reaction = 'dislike') THEN
			UPDATE proposals SET upvotes = upvotes - 1 WHERE id = 	OLD.proposal_id;
			UPDATE proposals SET downvotes = downvotes + 1 WHERE id = OLD.proposal_id;
		END IF;
		RETURN NEW;
	END IF;
	IF(TG_OP = 'DELETE') THEN
		IF(OLD.reaction = 'like') THEN
			UPDATE proposals SET upvotes = upvotes - 1 WHERE id = NEW.proposal_id;			
		ELSIF(OLD.reaction = 'dislike') THEN
			UPDATE proposals SET downvotes = downvotes - 1 WHERE id = NEW.proposal_id;
		END IF;
		RETURN OLD;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;
------
CREATE TRIGGER proposal_reactions_tg
AFTER INSERT OR UPDATE OR DELETE ON proposal_reactions
FOR EACH ROW EXECUTE PROCEDURE proposal_reactions_tg_function();
-------------------------------
-------- Question Comments
-------------------------------
CREATE OR REPLACE FUNCTION comments_question_reactions_tg_function() RETURNS trigger as $$
BEGIN
	IF(TG_OP = 'INSERT') THEN
		IF(NEW.reaction = 'like') THEN
			UPDATE comments_question SET upvotes = upvotes + 1 WHERE id = NEW.comment_id;
		ELSIF(NEW.reaction = 'dislike') THEN
			UPDATE comments_question SET downvotes = downvotes + 1 WHERE id = NEW.comment_id;
		END IF;
		RETURN NEW;
	END IF;
	IF(TG_OP = 'UPDATE') THEN
		IF(NEW.reaction = 'like') THEN
			UPDATE comments_question SET upvotes = upvotes + 1 WHERE id = 	OLD.comment_id;
			UPDATE comments_question SET downvotes = downvotes - 1 WHERE id = OLD.comment_id;
		ELSIF(NEW.reaction = 'dislike') THEN
			UPDATE comments_question SET upvotes = upvotes - 1 WHERE id = 	OLD.comment_id;
			UPDATE comments_question SET downvotes = downvotes + 1 WHERE id = OLD.comment_id;
		END IF;
		RETURN NEW;
	END IF;
	IF(TG_OP = 'DELETE') THEN
		IF(OLD.reaction = 'like') THEN
			UPDATE comments_question SET upvotes = upvotes - 1 WHERE id = NEW.comment_id;			
		ELSIF(OLD.reaction = 'dislike') THEN
			UPDATE comments_question SET downvotes = downvotes - 1 WHERE id = NEW.comment_id;
		END IF;
		RETURN OLD;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;
------
CREATE TRIGGER comments_question_reactions_tg
AFTER INSERT OR UPDATE OR DELETE ON comments_question_reactions
FOR EACH ROW EXECUTE PROCEDURE comments_question_reactions_tg_function();
------------------------------------
------ Comments Proposal -----------
------------------------------------
CREATE OR REPLACE FUNCTION comments_proposal_reactions_tg_function() RETURNS trigger as $$
BEGIN
	IF(TG_OP = 'INSERT') THEN
		IF(NEW.reaction = 'like') THEN
			UPDATE comments_proposal SET upvotes = upvotes + 1 WHERE id = NEW.comment_id;
		ELSIF(NEW.reaction = 'dislike') THEN
			UPDATE comments_proposal SET downvotes = downvotes + 1 WHERE id = NEW.comment_id;
		END IF;
		RETURN NEW;
	END IF;
	IF(TG_OP = 'UPDATE') THEN
		IF(NEW.reaction = 'like') THEN
			UPDATE comments_proposal SET upvotes = upvotes + 1 WHERE id = 	OLD.comment_id;
			UPDATE comments_proposal SET downvotes = downvotes - 1 WHERE id = OLD.comment_id;
		ELSIF(NEW.reaction = 'dislike') THEN
			UPDATE comments_proposal SET upvotes = upvotes - 1 WHERE id = 	OLD.comment_id;
			UPDATE comments_proposal SET downvotes = downvotes + 1 WHERE id = OLD.comment_id;
		END IF;
		RETURN NEW;
	END IF;
	IF(TG_OP = 'DELETE') THEN
		IF(OLD.reaction = 'like') THEN
			UPDATE comments_proposal SET upvotes = upvotes - 1 WHERE id = NEW.comment_id;			
		ELSIF(OLD.reaction = 'dislike') THEN
			UPDATE comments_proposal SET downvotes = downvotes - 1 WHERE id = NEW.comment_id;
		END IF;
		RETURN OLD;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;
------
CREATE TRIGGER comments_proposal_reactions_tg
AFTER INSERT OR UPDATE OR DELETE ON comments_proposal_reactions
FOR EACH ROW EXECUTE PROCEDURE comments_proposal_reactions_tg_function();