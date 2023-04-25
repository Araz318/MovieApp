
 
import UIKit

class PersonController: UIViewController {

    @IBOutlet weak var personCollection: UICollectionView!
    var personModel = PersonViewModel()
    private let cellId = "\(TopImageBottomLabelCell.self)"

        override func viewDidLoad() {
            super.viewDidLoad()
            configreUI()
            personCollection.showsVerticalScrollIndicator = false
            configpersonModel()
            title = "Popular Person"
        }

        func configpersonModel(){
            personModel.getItems()
            personModel.successCallback = {
                   self.personCollection.reloadData()
               }
           
        }
    
    func configreUI () {
        personCollection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    }

    extension PersonController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return personModel.person.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TopImageBottomLabelCell
            cell.configure(data: personModel.person[indexPath.item])
            return cell
        }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let controller = storyboard?.instantiateViewController(identifier: "DetailController") as! DetailController
            controller.detailModel.id = personModel.person[indexPath.row].id
            //controller.personModel.person = detailModel.postId[indexPath.row].id
            navigationController?.show(controller, sender: nil)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width / 2 - 10, height: 230)
            
           }

       }
    

