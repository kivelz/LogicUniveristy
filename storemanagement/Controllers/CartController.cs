using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web.Mvc;
using storemanagement.Models;
using storemanagement.Models.DTO;
using storemanagement.DAL;

namespace storemanagement.Controllers
{
    public class CartController : Controller
    {
        private readonly ProductDAL db = new ProductDAL();
        private readonly UserDAL user = new UserDAL();
        private readonly RequestDal requestdal = new RequestDal();
        private readonly RequestItemDal detailContext = new RequestItemDal();

        // GET: Cart
        public ActionResult Index()
        {

            var cart = Session["cart"] as List<RequisitionDTO> ?? new List<RequisitionDTO>();


            if (cart.Count == 0 || Session["cart"] == null)
            {
                ViewBag.Message = "Your cart is empty.";

                return View();
            }

            int qty = 0;

            foreach (var item in cart)
            {
                qty += item.Qty;
            }
            ViewBag.TotalQty = qty;
            return View(cart);


        }

        public ActionResult CartPartial()
        {

            RequisitionDTO request = new RequisitionDTO();
            int qty = 0;

            if (Session["cart"] != null)
            {
                var list = (List<RequisitionDTO>)Session["cart"];


                foreach (var item in list)
                {
                    qty += item.Qty;
                }
                request.Qty = qty;

            }
            else
            {
                request.Qty = 0;
            }
            return PartialView(request);
        }

        public ActionResult AddToCart(int id)
        {
            //POst cart
            List<RequisitionDTO> cart = Session["cart"] as List<RequisitionDTO> ?? new List<RequisitionDTO>();


            // Init CartVM
            RequisitionDTO model = new RequisitionDTO();


            // Get the product
            Product product = db.Find(id);


            var productInCart = cart.FirstOrDefault(x => x.ProductId == id);

            if (productInCart == null)
            {
                cart.Add(new RequisitionDTO()
                {
                    ProductId = product.ProductId,
                    ProductCode = product.item_code,
                    ProductDescription = product.Description,
                    Metric = product.Unit.name,
                    Qty = 1,

                });
            }
            else
            {
                // If it is, increment
                productInCart.Qty++;

            }


            // Get total qty and price and add to model

            int qty = 0;

            foreach (var item in cart)
            {
                qty += item.Qty;

            }

            model.Qty = qty;

            // Save cart back to session
            Session["cart"] = cart;

            // Return partial view with model
            return PartialView(model);
        }

        public JsonResult ProdIncrement(int productId)
        {
            List<RequisitionDTO> cart = Session["cart"] as List<RequisitionDTO>;

            RequisitionDTO item = cart.FirstOrDefault(x => x.ProductId == productId);

            if (item != null)
            {
                item.Qty++;
            }

            var result = new { qty = item.Qty };

            return Json(result, JsonRequestBehavior.AllowGet);

        }

        //Produce decrement
        public JsonResult ProdDecrement(int productId)
        {
            List<RequisitionDTO> cart = Session["cart"] as List<RequisitionDTO>;

            RequisitionDTO item = (cart ?? throw new InvalidOperationException()).FirstOrDefault(x => x.ProductId == productId);

            if (item.Qty > 1)
            {
                item.Qty--;
            }
            else
            {
                item.Qty = 0;
                cart.Remove(item);
            }

            var result = new { qty = item.Qty };

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public void RemoveProduct(int productId)
        {
            List<RequisitionDTO> cart = Session["cart"] as List<RequisitionDTO>;

            RequisitionDTO item = (cart ?? throw new InvalidOperationException()).FirstOrDefault(x => x.ProductId == productId);

            cart.Remove(item);

        }

        [HttpPost]
        public async Task<ActionResult> RequestOrder()
        {
            List<RequisitionDTO> cart = Session["cart"] as List<RequisitionDTO>;

            RequestItem list = new RequestItem();

            Guid guid = (Guid)Session["UserId"];
          
            //for email
//            int empDeptHeadName = emp.Department.Dept_head;
            Request requestDetails = new Request();

            Employee emp = await user.FindBySessionId(guid);

            string dept = user.DeptName(emp);

            AddToRequest(requestDetails, dept, emp);
            AddItemsToRequest(list, cart, requestDetails, emp);


           

//            var client = new SmtpClient("hotmail.com", 2525)
//            {
//                Credentials = new NetworkCredential("21f57cbb94cf88", "e9d7055c69f02d"),
//                EnableSsl = true
//            };
//
//
//            client.Send("admin@logicUniveristy.com", $"{empDeptHeadName}",
//                        $"New request from {emp.name} OrderId: {requestDetails.Id}",
//                         "A request has been made for stationary purchase. Please log in to approve request");

            //empty cart
            Session["cart"] = null;
            return RedirectToAction("Category", "Stationary");
        }

        public void AddToRequest(Request requestDetails, string dept, Employee emp)
        {
            requestDetails.employeeName = emp.name;
            requestDetails.employeeNo = emp.empNo;
            requestDetails.deptName = dept;
            requestDetails.remarks = "";
            requestDetails.status = "Pending";
            requestDetails.approvalDate = DateTime.Now;
            requestDetails.createdAt = DateTime.Now;
            requestDetails.EmployeeId = emp.EmployeeId;

            detailContext.Add(requestDetails);
            detailContext.Save(requestDetails);

        }

        public void AddItemsToRequest(RequestItem list, List<RequisitionDTO> cart, Request request, Employee emp)
        {
            foreach (var item in cart)
            {
                list.EmployeeId = emp.EmployeeId;
                list.RequestId = request.RequestId;
                list.ProductId = item.ProductId;
                list.productCat = item.ProductCode;
                list.productDesc = item.ProductDescription;
                list.qty = item.Qty;

                requestdal.Add(list);
                requestdal.Save(list);
            }

        }

    }

}