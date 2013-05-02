class AlphabetController < UIViewController
  def viewDidLoad
    super
    self.title = "Alphabet"
    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    @table.autoresizingMask = UIViewAutoresizingFlexibleHeight
    self.view.addSubview(@table)

    @table.dataSource = self
    @table.delegate = self

    @data = ("A".."Z").to_a
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @data.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier)
    cell ||= UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: @reuseIdentifier)
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    cell.textLabel.text = @data[indexPath.row]
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    letter = @data[indexPath.row]

    controller = UIViewController.alloc.initWithNibName(nil, bundle: nil)
    controller.view.backgroundColor = UIColor.whiteColor
    controller.title = letter
    label = UILabel.alloc.initWithFrame(CGRectZero)
    label.text = letter
    label.sizeToFit
    label.center = [controller.view.frame.size.width / 2,
                    controller.view.frame.size.height / 2]
    controller.view.addSubview(label)
    self.navigationController.pushViewController(controller, animated: true)
  end
end
