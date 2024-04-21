#include <iostream>
#include <libpq-fe.h>
#include <vector>
#include <string>


class DatabaseConnector {
private:
	PGconn* connection;

public:
	DatabaseConnector(const char* conninfo) {
		connection = PQconnectdb(conninfo);
		if (PQstatus(connection) != CONNECTION_OK) {
			std::cerr << "Failed to connect to database: " << PQerrorMessage(connection) << std::endl;
			throw std::runtime_error("Failed to connect to database");
		}
		PQsetClientEncoding(connection, "UTF8");
	}

	~DatabaseConnector() {
		PQfinish(connection);
	}

	PGresult* executeQuery(const char* query) {
		return PQexec(connection, query);
	}

	std::vector<std::vector<std::string>> getQueryResults(PGresult* res) {
		std::vector<std::vector<std::string>> results;

		if (PQresultStatus(res) != PGRES_TUPLES_OK) {
			std::cerr << "Query failed: " << PQresultErrorMessage(res) << std::endl;
			PQclear(res);
			return results;
		}

		int rows = PQntuples(res);
		int cols = PQnfields(res);

		for (int i = 0; i < rows; ++i) {
			std::vector<std::string> row;
			for (int j = 0; j < cols; ++j) {
				const char* value = PQgetvalue(res, i, j);
				row.push_back(value);
			}
			results.push_back(row);
		}

		PQclear(res);
		return results;
	}
	static std::string getUserInfo(int userID)
	{
		return ("SELECT * FROM Users WHERE user_id =" + std::to_string(userID) + " ; ");
	}
	static std::string getUserCompanylInfo(int userID)
	{
		return ("SELECT u.first_name, u.last_name, c.company_name, p.position_name FROM Users u JOIN Companies c ON u.company_id = c.company_id JOIN Positions p ON u.position_id = p.position_id WHERE u.user_id = " + std::to_string(userID) + " ; ");
	}
	static std::string getUserPersonalInfo(int userID)
	{
		return ("SELECT h.hobby_name FROM UserHobbies uh JOIN Hobbies h ON uh.hobby_id = h.hobby_id WHERE uh.user_id = " + std::to_string(userID) + " ; ");
	}
	static std::string getUserLanguageInfo(int userID)
	{
		return ("SELECT pl.language_name FROM UserProgrammingLanguages upl JOIN ProgrammingLanguages pl ON upl.language_id = pl.language_id WHERE upl.user_id = " + std::to_string(userID) + " ; ");
	}
	static std::string getUserChatsList(int userID)
	{
		return("SELECT DISTINCT user_id FROM( SELECT sender_id AS user_id FROM ChatMessages WHERE receiver_id = " + std::to_string(userID) + " UNION ALL SELECT receiver_id AS user_id FROM ChatMessages WHERE sender_id = " + std::to_string(userID) + " ) AS all_users WHERE user_id <> " + std::to_string(userID) + " ; ");
	}
	static std::string getChatData(int senderID, int receiverID)
	{
		return ("SELECT * FROM ChatMessages WHERE(sender_id = " + std::to_string(senderID) + " AND receiver_id = " + std::to_string(receiverID) + ") OR(sender_id = " + std::to_string(senderID) + " AND receiver_id = " + std::to_string(receiverID) + " ); ");
	}
	static std::string regUser(std::string firstName, std::string lastName, std::string middleName, int compayID, int expYears, int positionID, std::string email, std::string password)
	{
		return ("INSERT INTO Users (first_name, last_name, middle_name, company_id, experience_years, position_id, email, password_hash) VALUES('" + firstName + "', '" + lastName + "', '" + middleName + "', " + std::to_string(compayID) + ", " + std::to_string(expYears) + ", " + std::to_string(positionID) + ", '" + email + "' , '" + password + "' ); ");
	}
	static std::string regUserHobbied(int userID, int hobbyID)
	{
		return ("INSERT INTO UserHobbies (user_id, hobby_id) VALUES (" + std::to_string(userID) + ", " + std::to_string(hobbyID) + ");");
	}
	static std::string regUserProgrammingLanguage(int userID, int languageID)
	{
		return ("INSERT INTO UserProgrsammingLanguages (user_id, language_id) VALUES (" + std::to_string(userID) + ", " + std::to_string(languageID) + ");");
	}
	static std::string getUserIDsByCompany(int companyID) {
		return ("SELECT user_id FROM Users WHERE company_id = " + std::to_string(companyID) + ";");
	}
	static std::string getRequestedUserInfo(int userID)
	{
		return ("SELECT * FROM requestedusers WHERE user_id =" + std::to_string(userID) + " ; ");
	}
	static std::string deleteRequestedUsers(int userID)
	{
		return ("DELETE FROM requestedusers WHERE user_id = " + std::to_string(userID) + ";");
	}
	static std::string deleteUserHobbies(int userID)
	{
		return ("DELETE FROM userhobbies WHERE user_id = " + std::to_string(userID) + ";");
	}

};
