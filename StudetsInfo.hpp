#ifndef STUDETSINFO_HPP
#define STUDETSINFO_HPP

#include<vector>
#include<unordered_map>

#include <QString>

namespace rating
{

using IDType = quint16;

using Student = std::vector<std::pair<QString, QString>>;
using Group = std::unordered_map<QString, Student>;
using Groups = std::unordered_map<QString, Group>;
}

#endif // STUDETSINFO_HPP
