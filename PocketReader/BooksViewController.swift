//
//  ViewController.swift
//  PocketReader
//
//  Created by Yurii Sameliuk on 13/11/2020.
//

import UIKit
enum GenreType: String {
    case activeNow
    case psychology
    case children
    case detectives
    case novels
}

struct BookItem: Hashable {
    var name: String
    var genre: GenreType
    var author: String
    var edition: Int
    var pages: Int
    var bookDescription: String
    var imageName: String
    let identifire = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifire)
    }
    
    static func == (lhs: BookItem, rhs: BookItem) -> Bool {
        return lhs.identifire == rhs.identifire
    }
    
    static func getBooks() -> [BookItem] {
        return [
            BookItem(name: "Расширить сознание легально", genre: .psychology,
                     author: "Владислав Гайдукевич", edition: 2019, pages: 40,
                     bookDescription: "Уникальная книга о детальной работе социальной машины, построена в формате переплетения точек обзора: от объективного факта до наилучшего варианта его субъективной адаптации. Единственное в своем роде пособие, имеющее ключи дешифровки для экзистенциального кризиса любого масштаба. Все, что нужно понимать, для счастья и самореализации есть на этих страницах. Рекомендуется к прочтению вне зависимости от возраста и социального статуса.",
                     imageName: "111"),
            BookItem(name: "Психология влияния", genre: .psychology,
            author: "Роберт Чалдини", edition: 1993, pages: 380,
            bookDescription: "К искусству убеждения можно относиться по-разному. Одни стремятся овладеть им в совершенстве, чтобы всегда и везде добиваться своих целей, другие считают недопустимым, когда используя механизмы воздействия, людям навязывают невыгодные для них условия. Однако никто из нас не хочет стать жертвой манипуляторов, легкой добычей для продавцов, сборщиков средств и рекламодателей.\nВ этой книге Роберт Чалдини, доктор наук, профессор психологии и признанный эксперт в сфере влияния и убеждения, рассматривает шесть универсальных приемов, благодаря которым вы станете настоящим мастером уговоров. В то же время, зная об этих приемах, вы всегда сможете избежать нежелательного воздействия со стороны.",
            imageName: "222"),
            BookItem(name: "Календарь ма(й)я", genre: .children,
            author: "Виктория Ледерман", edition: 2016, pages: 210,
            bookDescription: "Просыпаться утром и обнаруживать, что проживаешь дни в обратном порядке, – штука посерьезней «Дня сурка»! Шестиклассник Глеб Елизаров всего лишь нацарапал на древней стене дату «23.05.2013» – и отправился с парой одноклассников сначала в 22 мая, а затем в 21-е, 20-е, 19-е… \nНедавно перешедший в новую школу Глеб, увалень-отличник Юра Карасев и погрязшая в домашних делах Лена Зюзина видят в повторении вчерашних и позавчерашних событий кое-какие плюсы. Можно переписать итоговую контрольную, уклониться от драки с хулиганом или даже без угрызений совести спустить все карманные деньги на угощение – ведь утром купюры и монеты снова окажутся в кошельке!.",
            imageName: "333"),
            BookItem(name: "Поллианна", genre: .children,
            author: "Элинор Портер", edition: 1913, pages: 260,
            bookDescription: "После смерти папы маленькую Поллианну отправляют жить к сварливой тётке. Впереди у неё ещё много испытаний… Эта книга, написанная ровно сто лет назад, вошла в золотой фонд литературы для детей.",
            imageName: "444"),
            BookItem(name: "Происхождение", genre: .detectives,
            author: "Дэн Браун", edition: 2017, pages: 530,
            bookDescription: "Происхождение» – пятая книга американского писателя Дэна Брауна о гарвардском профессоре, специалисте по религиозной символике Роберте Лэнгдоне. В этот раз все начинается с, возможно, одного из наиболее знаковых событий в истории: наконец-то стало известно, откуда произошло человечество. Футуролог Эдмонд Кирш, совершивший невероятное открытие, был всего лишь в шаге от того, чтобы полностью изменить представление современников о мире. Однако его речи не суждено было прозвучать в стенах Музея Гуггенхайма. Ученого убили на глазах гостей. И начался хаос…",
            imageName: "555"),
            BookItem(name: "Самая хитрая рыба", genre: .detectives,
            author: "Елена Михалкова", edition: 2019, pages: 390,
            bookDescription: "Перед вами двадцать шестой роман цикла загадочных детективных историй «Расследования Макара Илюшина и Сергея Бабкина» от признанного мастера остросюжетной прозы Елены Михалковой.\nПожилая женщина Анна Сергеевна Бережкова живет в маленьком поселке, где все друг друга знают. Когда в соседнем пустующем доме наконец появляются новые жильцы, старушка сначала радуется, однако после знакомства с Натальей и Антоном решает, что лучше бы дом и дальше пустовал.",
            imageName: "666"),
            BookItem(name: "Земное притяжение", genre: .novels,
            author: "Татьяна Устинова", edition: 2017, pages: 310,
            bookDescription: "Их четверо. Летчик из Анадыря; знаменитый искусствовед; шаманка из алтайского села; модная московская художница. У каждого из них своя жизнь, но возникает внештатная ситуация, и эти четверо собираются вместе. Точнее – их собирают для выполнения задания!.. В тамбовской библиотеке умер директор, а вслед за этим происходят странные события – библиотека разгромлена, словно в ней пытались найти все сокровища мира, а за сотрудниками явно кто-то следит. Что именно было спрятано среди книг?.. И отчего так важно это найти?..\nКто эти четверо? Почему они умеют все – управлять любыми видами транспорта, стрелять, делать хирургические операции, разгадывать сложные шифры?.. Летчик, искусствовед, шаманка и художница ответят на все вопросы и пройдут все испытания. У них за плечами – целая общая жизнь, которая вмещает все: любовь, расставания, ссоры с близкими, старые обиды и новые надежды. Они справятся с заданием, распутают клубок, переживут потери и обретут любовь – земного притяжения никто не отменял!..",
            imageName: "777"),
            BookItem(name: "Город женщин", genre: .novels,
            author: "Элизабет Гилберт", edition: 2019, pages: 470,
            bookDescription: "Нью-Йорк, сороковые годы XX века. Девятнадцатилетнюю Вивиан Моррис только что выгнали из колледжа Вассар за систематические прогулы и заваленные экзамены. Богатые, но вечно занятые собой родители отправляют непутевую дочь в Манхэттен к тетушке Пег, владеющей ярким, но, по всей видимости, доживающим последние годы театром «Лили».",
            imageName: "888")
        ]
    }
}

class BooksViewController: UIViewController {
    
    var objects = BookItem.getBooks()
    
    enum Section: Int {
        case activeNow = 0, psychology, children, novels, detectives
        
        func description() -> String {
            switch self {
            case .activeNow:
                return ""
            case .psychology:
                return "ПСИХОЛОГИЯ МОТИВАЦИЯ"
            case .children:
                 return "ДЕТСКИЕ КНИГИ"
            case .novels:
                return "ЛЮБОВНЫЕ РОМАНЫ"
            case .detectives:
                return "ДЕТЕКТИВЫ"
            //case .someError:
             //   return ""
            }
        }
        
        func genreType() -> GenreType {
            switch self {
            case .activeNow:
                return .activeNow
            case .psychology:
                return .psychology
            case .children:
                return .children
            case .novels:
                return .novels
            case .detectives:
                return .detectives
            }
        }
        
        }
    
    var tableView: UITableView!
    var dataSource: DataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupElements()
        setupConstraints()
        configureDataSource()
    }
    
    private func initialSnapshot() -> NSDiffableDataSourceSnapshot<Section, BookItem> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, BookItem>()
        snapshot.appendSections([.activeNow])
        snapshot.appendItems([], toSection: .activeNow)
        snapshot.appendSections([.psychology])
        snapshot.appendItems(objects.filter({$0.genre == .psychology}), toSection: .psychology)
        snapshot.appendSections([.children])
        snapshot.appendItems(objects.filter({$0.genre == .children}), toSection: .children)
        snapshot.appendSections([.detectives])
        snapshot.appendItems(objects.filter({$0.genre == .detectives}), toSection: .detectives)
        snapshot.appendSections([.novels])
        snapshot.appendItems(objects.filter({$0.genre == .novels}), toSection: .novels)
        return snapshot
    }
    
    private func configureDataSource() {
        dataSource = DataSource(tableView: tableView, cellProvider: { (tableView, indexPath, bookItem) -> UITableViewCell? in
            var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cell")
            cell.textLabel?.text = bookItem.name
            cell.backgroundColor = .systemBackground
            cell.editingAccessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            return cell
        })
    let snapshot = initialSnapshot()
        dataSource.apply(snapshot, animatingDifferences: false, completion: nil)
    }
}

//MARK: - view setup
//Funkcii po nastrojke interfeisa
extension BooksViewController {
    
     func setupElements() {
        
        view.backgroundColor = .systemBackground
        
        tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
        // wkly4aem režum redaktirowanija
        tableView.setEditing(true, animated: true)
        tableView.delegate = self
        // wubor ja4eek tablicu w režume redaktirowanija
        tableView.allowsSelectionDuringEditing = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        title = "PocketReader"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension BooksViewController {
    
     func setupConstraints() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

//MARK: - Data Source
extension BooksViewController {
    class DataSource: UITableViewDiffableDataSource<Section, BookItem> {
        override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            let sectionKind = Section(rawValue: section)
            return sectionKind?.description()
        }
        
        override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
            if section == 0 {
                return "Add your favorite book"
            } else {
                return nil
            }
        }
        
        override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .insert {
                let destinationIndexPath = IndexPath(row: 0, section: 0)
                // proweriaem sys4estwyet li ja4ejka na kotoryjy nažali
                guard let sourceIdentifire = itemIdentifier(for: indexPath) else { return }
                // sozdaem element kotoruj peremes4aem
                let destinationIdentifire = itemIdentifier(for: destinationIndexPath)
                // fiksiryem izmenenija
                var snapshot = self.snapshot()
                if let destinationIdentifire = destinationIdentifire {
                    snapshot.deleteItems([sourceIdentifire])
                    snapshot.insertItems([sourceIdentifire], beforeItem: destinationIdentifire)
                    apply(snapshot)
                } else {
                    let destinationSectionIdentifier = snapshot.sectionIdentifiers[destinationIndexPath.section]
                    snapshot.deleteItems([sourceIdentifire])
                    snapshot.appendItems([sourceIdentifire], toSection: destinationSectionIdentifier)
                    apply(snapshot)
                }
            }
            if editingStyle == .delete {
                // kniga kotoryjy chotim ydalit
                guard let sourceIdentifier = itemIdentifier(for: indexPath) else { return }
                var snapshot = self.snapshot()
                // opredeliaem kydawozwras4at ydalennyjy knigy
                for section in snapshot.sectionIdentifiers {
                    if section.genreType() == sourceIdentifier.genre {
                        snapshot.deleteItems([sourceIdentifier])
                        snapshot.appendItems([sourceIdentifier], toSection: section)
                        apply(snapshot)
                    }
                }
            }
        }
    }
}

//MARK: - UITableViewDelegate

extension BooksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.section == 0 {
            return .delete
        } else {
            return .insert
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let bookItem = self.dataSource.itemIdentifier(for: indexPath) else { return }
        
        let detailViewController = DetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

