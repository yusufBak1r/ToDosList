//
//  ToDoCell.swift
//  ToDosApp
//
//  Created by yusuf bakır on 25.05.2024.
//

import UIKit
protocol  ToDoCellProtocol {
    func deleteClicked(indexPath : IndexPath)
}
class ToDoCell: UITableViewCell {
    var delegate :ToDoCellProtocol?
    var indexPath: IndexPath?
    @IBOutlet weak var titleName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

    @IBAction func deleteTapped(_ sender: Any) {
        if let indexPath  = indexPath{
            delegate?.deleteClicked(indexPath: indexPath)
        }
    }
}

