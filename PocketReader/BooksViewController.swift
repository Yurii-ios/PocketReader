//
//  ViewController.swift
//  PocketReader
//
//  Created by Yurii Sameliuk on 13/11/2020.
//

import UIKit

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
        // nachodiatcia imena wsech wubranuch knig
        let pickedBooks = Set(UserSettings.userBooks.lazy.map({ $0.name }))
        //proweriaem nachoditsia li kniga w ja4ejke posle zagryzki
        let noPickedBooks = objects.filter{ !pickedBooks.contains($0.name)}
        // sochraniaem poly44enuj rezyltat
        objects = noPickedBooks
        
        snapshot.appendSections([.activeNow])
        snapshot.appendItems(UserSettings.userBooks, toSection: .activeNow)
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
            
            let snapshot = self.snapshot()
            let pickedBooks = snapshot.itemIdentifiers(inSection: .activeNow)
            UserSettings.userBooks = pickedBooks
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

