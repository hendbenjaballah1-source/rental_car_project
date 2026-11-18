package isetb.tp2.locationvoitures

import android.view.LayoutInflater
import android.view.ViewGroup
import android.widget.Button
import android.widget.ImageView
import androidx.appcompat.widget.TooltipCompat
import androidx.recyclerview.widget.RecyclerView

class VoitureAdapter(
    private val images: List<Int>,
    private val adresses: List<String>,
    private val onDetailClick: (Int) -> Unit
) : RecyclerView.Adapter<VoitureAdapter.VH>() {

    class VH(vue: android.view.View) : RecyclerView.ViewHolder(vue) {
        val img: ImageView = vue.findViewById(R.id.imgVoiture)
        val btn: Button = vue.findViewById(R.id.btnDetail)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): VH {
        val vue = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_voiture_horizontal, parent, false)
        return VH(vue)
    }

    override fun onBindViewHolder(h: VH, position: Int) {
        h.img.setImageResource(images[position])
        TooltipCompat.setTooltipText(h.img, adresses[position])
        h.btn.setOnClickListener { onDetailClick(position) }
    }

    override fun getItemCount() = images.size
}